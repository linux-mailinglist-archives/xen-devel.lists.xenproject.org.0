Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S9f4HeRWTmq8KwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:55:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D264726FF1
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:55:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="W/qNM/+U";
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357046.1611555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSkX-0004jv-7W; Wed, 08 Jul 2026 13:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357046.1611555; Wed, 08 Jul 2026 13:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSkX-0004iA-3n; Wed, 08 Jul 2026 13:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1357046;
 Wed, 08 Jul 2026 13:55:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f420331a900080a8@swg.vates.tech>)
 id 1whSkV-0004f5-4Q
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:55:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSkU-008XJP-2d
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:55:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f420331a900080a8@swg.vates.tech>)
 id 6a4e56d8-5cb7-0a2a0a5109dd-0a2a4502a61e-10
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:55:37 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f420331a900080a8@swg.vates.tech>)
 id 6a4e56d9-5a27-0a2a45020019-b9ff1c129b47-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:55:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f420331a900080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 13:55:33 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B37D181FAF;
 Wed,  8 Jul 2026 15:55:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=M8j0vMD3TJ3DnMviVILGwUtlnQI2mLHYx6a1dXB4nqs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=W/qNM/+U1Iigb4UBvqkwoe/VpfZaLvSYJmPMOlMyejBG/D0/unVN1+3AEo8yjr45yx1zCzsyk
 0541rjdykvpnbfao6jhOyoiLY/9b0gEQWSujKruNozuIsIJ55T2Y6LtZsO2GSlX/KHcETODU6ZC
 EGpLB94u/OiuhQa/vBGa5iOnIIW+0RcpEJFsR4kA4rVFri4a+9wFNa4Mkv8SWWC3gh111CQvSAZ
 P6c6440ylwb2pi2t9TGrR8OiNBzWWozVvuLPLE3qLtymMhaCP3P/mMLBLHHEEO0E7q6hBTtS44U
 Sazt2urkzu11TBUHIqRhcSB2jq3pPVmSpGtcmhiefAFg==
X-Zone-Loop: 77e3bd23bb02a9a44f929343fb7333db50de5eafe95f
x-campaign-type: default
x-transaction-id: 85d39dd3-3ccc-41f3-9058-88b946b07325
x-swg-uid: 01-311f3b39-e3c4-4995-bb6f-4337926173af
X-Mailer: Sweego
Message-ID:
 <1783518933.8631fc262581453bbf619ec5b2062170.19f420331a900080a8@vates.tech>
x-swg-bid: 1783518933.8631fc262581453bbf619ec5b2062170.19f420331a900080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 15:55:32 +0200
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
Subject: Re: [PATCH v6 11/16] PoC: libs/guest: use foreign copy during
 migration
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-12-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-12-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.42f.ffc384a7f4c1bfc1.19f42032f9c.bd0ca22a4286ae97=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783518932892
X-purgate-ID: tlsNG-720697/1783518937-545187C5-3E7D3385/0/0
X-purgate-type: clean
X-purgate-size: 1682
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 2D264726FF1

---=Part.42f.ffc384a7f4c1bfc1.19f42032f9c.bd0ca22a4286ae97=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


A note about the subject, a "PoC" or Proof-of-concept to me isn't
a patch that can be accepted, especialy if is a patch to an existing
library=2E

On Fri, Jun 19, 2026 at 02:04:56PM +0100, Frediano Ziglio wrote:
> From: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
>=20
> ministat confirms the improvement:
>=20
> ```
> x baseline
> + foreigncopy
>     N           Min           Max        Median           Avg        Std=
dev
> x  20     1=2E1306997     1=2E1447931     1=2E1356569     1=2E1365742   =
0=2E003242175
> +  20     0=2E4311504    0=2E44180303    0=2E43616705    0=2E43600089  0=
=2E0031094689
> Difference at 95=2E0% confidence
> 	-0=2E700573 +/- 0=2E00203311
> 	-61=2E639% +/- 0=2E133355%
> 	(Student's t, pooled s =3D 0=2E00317652)
> ```

There's been some comment about this stat in previous version of the
series, and the description is still the same=2E Could you describe how
the stat have been generated, and what the number mean?

Also, what's the different between "baseline" and "foreigncopy"=2E I've
only had a glimpse at this patch, and it just looks like the code have
been moved to a different part of the library, with somehow less lines
of code=2E

>=20
> The tests pass too, which means that it has correctly migrated all guest
> memory=2E

Which tests?

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.42f.ffc384a7f4c1bfc1.19f42032f9c.bd0ca22a4286ae97=---

