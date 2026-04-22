Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGsWMpuw6GldOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:27:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761684454D4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290309.1569928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVje-0003jM-VS; Wed, 22 Apr 2026 11:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290309.1569928; Wed, 22 Apr 2026 11:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVje-0003he-SC; Wed, 22 Apr 2026 11:27:14 +0000
Received: by outflank-mailman (input) for mailman id 1290309;
 Wed, 22 Apr 2026 11:27:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db4f19bfb000f373@swg.vates.tech>)
 id 1wFVjc-0003hQ-Kj
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:27:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVjb-007Gm0-KT
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:27:11 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db4f19bfb000f373@swg.vates.tech>)
 id 69e8b08e-e002-0a2a0a5209dd-0a2a450bc23e-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:27:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db4f19bfb000f373@swg.vates.tech>)
 id 69e8b08f-212f-0a2a450b0019-b9ff1c2284c5-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:27:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db4f19bfb000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Apr 2026 11:27:06 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8550E8109B;
 Wed, 22 Apr 2026 13:27:05 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=8ZWCJ8XJGt/kkm5qvDNUOLmiI7V87axTpQnRjjcZ+cg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gPjWNnsecyvqLtewSXYvFuUw4uCwhPYhF/WX9TyNLZFeCzvEDLiQNC7lBVDIrdvLQvIWqr60R
 QbErDWDppi6g1wFPnJTIqv9kCfE9KF7JrsQipB+IokYiAZD+eYskEh8LOnE32wrj8pOvz/Ud2zn
 4yb3m+Jlh5JmNqFpS+znfPZcFX+vSmj3Bt2LNnRbD5KpCTC9CivorNW+adPuluspZqymwkq9L4F
 xGg1dxe0AVJ4KvaHnQO3gcv0zmbTowfRVhxLo6Cvw7Nt372U6LI4msJ3Vz2vf31l4Ym/5TfKbB6
 BFpVH8Esx86cQ+ZO823As8pXIaKSS3UCIZFIDafjg9PQ==
X-Zone-Loop: b66acdbdfb35d9c841289f9d34cb577c64089a752c08
x-campaign-type: default
x-transaction-id: ee6e6152-d5b6-4c3b-b821-0fb8b826899b
x-swg-uid: 01-37bc3583-9b50-43ef-8bde-189d1569f1fe
X-Mailer: Sweego
Message-ID:
 <1776857226.8631fc262581453bbf619ec5b2062170.19db4f19bfb000f373@vates.tech>
x-swg-bid: 1776857226.8631fc262581453bbf619ec5b2062170.19db4f19bfb000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 22 Apr 2026 13:27:05 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/xenpm: fix FreeBSD build
References: <20260421153224.36368-1-roger.pau@citrix.com>
 <2204fbae-be5b-4f56-ad2a-cd5692db81cb@suse.com>
 <aeedB31aEBJb2Pa8@macbook.local>
 <bb1d52a4-c344-4653-b10f-0781c2900cb0@suse.com>
 <aeiSAFy_P1QoIBaP@macbook.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aeiSAFy_P1QoIBaP@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.257d.d1266fe5980cbbd5.19db4f199d2.c29e57fdea891acb=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776857225686
X-purgate-ID: tlsNG-42698a/1776857231-7E573F3B-72E6A5C3/0/0
X-purgate-type: clean
X-purgate-size: 2244
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-0.624];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 761684454D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.257d.d1266fe5980cbbd5.19db4f199d2.c29e57fdea891acb=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 11:16:48AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 22, 2026 at 09:15:56AM +0200, Jan Beulich wrote:
> > On 21=2E04=2E2026 17:51, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, Apr 21, 2026 at 05:35:57PM +0200, Jan Beulich wrote:
> > >> On 21=2E04=2E2026 17:32, Roger Pau Monne wrote:
> > >>> --- a/tools/misc/xenpm=2Ec
> > >>> +++ b/tools/misc/xenpm=2Ec
> > >>> @@ -1377,7 +1377,7 @@ static int fetch_dts_temp(xc_interface *xch,=
 uint32_t cpu, bool package, int *te
> > >>>      {
> > >>>      case 0:
> > >>>          /* This CPU isn't online or can't query this MSR */
> > >>> -        errno =3D ENODATA;
> > >>> +        errno =3D ENODEV;
> > >>>          return -1;
> > >>
> > >> "No such device", however, isn't quite what we want to convey here=
=2E If no
> > >> better error code can be found that's available on FreeBSD and Linu=
x, I'm
> > >> inclined to suggest that we stick to ENODATA where available=2E
> > >=20
> > > Seems like a lot of complexity, for very limited usefulness=2E
> >=20
> > What's complex about
> >=20
> > #ifndef ENODATA
> > # define ENODATA ENODEV
> > #endif
> >=20
> > (perhaps with a brief comment)?
>=20
> IMO it's best if we can avoid instances of ENODATA in the toolstack
> code base, specially if it's individual ones like this that can be
> fixed=2E  Otherwise new instances might appear elsewhere, and we don't
> want to be adding this bodge everywhere if avoidable=2E
>=20
> If we had a sizable usage of ENODATA in the code base I would indeed
> recommend such define approach=2E

Yeah, let's just use ENODEV on every platform in this case=2E

We already have ENODATA translated to ENOENT in libxl (for privcmd), so
let's not add a different translation here=2E

So patch looks fine to me as is:
Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

As for the error message, patch welcome ;-)=2E

Thanks,


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.257d.d1266fe5980cbbd5.19db4f199d2.c29e57fdea891acb=---

