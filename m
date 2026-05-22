Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC7COB1aEGqDWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:29:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947695B5287
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316818.1586160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPvX-0002xJ-TX; Fri, 22 May 2026 13:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316818.1586160; Fri, 22 May 2026 13:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPvX-0002vW-Ph; Fri, 22 May 2026 13:28:35 +0000
Received: by outflank-mailman (input) for mailman id 1316818;
 Fri, 22 May 2026 13:28:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fdf8954000f373@swg.vates.tech>)
 id 1wQPvW-0002v7-Gb
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:28:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQPvV-006aFe-Il
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:28:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fdf8954000f373@swg.vates.tech>)
 id 6a105a01-5cb7-0a2a0a5109dd-0a2a450287a0-0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:28:33 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fdf8954000f373@swg.vates.tech>)
 id 6a105a01-af86-0a2a45020019-b9ff1c2282d3-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:28:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fdf8954000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:28:30 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7668C866B8;
 Fri, 22 May 2026 15:28:29 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=x+/BT0AdbhlPQPZLi9jRAjjEDzjR6iaAaT9AsOyrBvs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hG8G96TNdukgtwCrvHGHcBnek6sOwCXvmlWS/6e/qxf+5i/QmHOiOWqrIyX5Uvdu6j/yneJ61
 ASw+b6wDF+C5+pzTHcas8zwDIw8KdARwialqeBAdLhP6L9CVuPLZOYm7rDVDOutwxHAjPNsYbmH
 wLN9t/ziT5qv02tSHLv6Mt9yUANqo6Xzi7Ng8P0QLvk/msnbrEm25rS3lnu3K7dXtrU8PWQdJBo
 152jy+ZFcKic9/Hut8rYGob0fyWNsgio1T1IFpMT+rLC+QKRKkF+75YNGd+3M/lbdvk9P8taP4s
 MX0RMneGDIR/DcALin0RXxrDaUtUM3qp7zZrt5uqyX5A==
X-Zone-Loop: c062464a5c28aaac552a663c29e0fb710ab59692012c
x-campaign-type: default
x-transaction-id: 7987c31b-b1de-4d41-ab32-bb0a90cb3ea4
x-swg-uid: 01-78f15851-b4fb-4505-9705-5f8412599245
X-Mailer: Sweego
Message-ID:
 <1779456510.8631fc262581453bbf619ec5b2062170.19e4fdf8954000f373@vates.tech>
x-swg-bid: 1779456510.8631fc262581453bbf619ec5b2062170.19e4fdf8954000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:28:29 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 01/13] Add Alpine 3.23 containers
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <d778b5c5936932fa0925ffa3bf3e1656da26bbaf.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d778b5c5936932fa0925ffa3bf3e1656da26bbaf.1777898148.git-series.marmarek@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1251.bb4ab168c438cb5a.19e4fdf869d.f7dfd61d7377498e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779456509597
X-purgate-ID: tlsNG-720697/1779456513-AB563161-4DDC2498/0/0
X-purgate-type: clean
X-purgate-size: 790
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 947695B5287
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1251.bb4ab168c438cb5a.19e4fdf869d.f7dfd61d7377498e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 02:35:40PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Add it in all variants:
> - base container
> - build container
> - initramfs archive
>=20
> libdw used to be part of libelf in Alpine 3=2E18, but it's a separate
> package in 3=2E23=2E
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1251.bb4ab168c438cb5a.19e4fdf869d.f7dfd61d7377498e=---

