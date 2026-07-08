Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KFXoLHtOTmoQKgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:19:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF91726BC8
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 15:19:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Eke6TuiP;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357010.1611519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSBn-0005kw-0s; Wed, 08 Jul 2026 13:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357010.1611519; Wed, 08 Jul 2026 13:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whSBm-0005i7-Tq; Wed, 08 Jul 2026 13:19:46 +0000
Received: by outflank-mailman (input) for mailman id 1357010;
 Wed, 08 Jul 2026 13:19:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41e260b600080a8@swg.vates.tech>)
 id 1whSBl-0005hv-Pm
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:19:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whSBk-00HOkU-Tp
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 15:19:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41e260b600080a8@swg.vates.tech>)
 id 6a4e4e60-bab6-0a2a0a5309dd-0a2a4503d01c-26
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:19:44 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f41e260b600080a8@swg.vates.tech>)
 id 6a4e4e70-ec1a-0a2a45030019-b9ff1c23a69f-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 15:19:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f41e260b600080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 13:19:42 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 10FC280272;
 Wed,  8 Jul 2026 15:19:42 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=94Sy5qBxp6H/DVT8lMvsEoxD/IB0D7QRBRxr1zZGs/E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Eke6TuiPpjQ9A4qUbFWaCbSkdpe4RGVQfazN26ivBeGGrYdx9OhKOpOW/DRxUAOM261Pnrfjw
 jflUK1ZAcF1nxeqomnkNBDsCQV1OElOOGOqwZGoiO6IIx3Icr5cWgYgPq9sjdCKxhaq2p6HR7SQ
 MO6wl/TQLXSjAy5tpdBE/xBYTy229hjCq6sKp023D8NVA5AbUNDPlWZsADTPXgnCzs1JSeHcRe8
 sO/Rk4rbHkA4KRE/sx4ICKpNd8gRyid7hafFCMmaEVgT8/3MvmPrClabtCwkRInV64LPw4THMTj
 /Fjb56cLQrMOdXVJhB/+yLVIkip6ImiYnjEwc8Y4geRQ==
X-Zone-Loop: aa225c801236e218e2f0f96fa0f4fd28dea1280fd7a9
x-campaign-type: default
x-transaction-id: bf673ab5-2c3a-467c-bf56-e3bb8ee97c98
x-swg-uid: 01-a9cc4a23-07d7-4877-8b3e-7000a6251f9d
X-Mailer: Sweego
Message-ID:
 <1783516782.8631fc262581453bbf619ec5b2062170.19f41e260b600080a8@vates.tech>
x-swg-bid: 1783516782.8631fc262581453bbf619ec5b2062170.19f41e260b600080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 15:19:41 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 07/16] libs/guest: avoids using 2 indexes
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-8-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-8-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.425.d36caf76e1605c2e.19f41e25e82.3fb0f98fc87373b1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783516782211
X-purgate-ID: tlsNG-33051d/1783516784-B53815D1-416E7A06/0/0
X-purgate-type: clean
X-purgate-size: 758
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AF91726BC8

---=Part.425.d36caf76e1605c2e.19f41e25e82.3fb0f98fc87373b1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 02:04:52PM +0100, Frediano Ziglio wrote:
> Simplify code, after the first scan of the various arrays we don't need =
to
> keep original types and PFNs but only the ones having data=2E
>=20
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>
> Reviewed-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.425.d36caf76e1605c2e.19f41e25e82.3fb0f98fc87373b1=---

