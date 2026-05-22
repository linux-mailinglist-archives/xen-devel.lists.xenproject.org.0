Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JMrOHpaEGqDWgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:30:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965485B52C3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316824.1586169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPxL-0004SJ-6W; Fri, 22 May 2026 13:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316824.1586169; Fri, 22 May 2026 13:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPxL-0004Q9-3n; Fri, 22 May 2026 13:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1316824;
 Fri, 22 May 2026 13:30:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe13aa6000f373@swg.vates.tech>)
 id 1wQPxJ-0004Q3-OL
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:30:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQPxJ-007bEm-4J
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:30:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe13aa6000f373@swg.vates.tech>)
 id 6a105a64-e002-0a2a0a5209dd-0a2a4508a6c8-24
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:30:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fe13aa6000f373@swg.vates.tech>)
 id 6a105a70-63b5-0a2a45080019-b9ff1c2287f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:30:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fe13aa6000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:30:21 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 954D38639F;
 Fri, 22 May 2026 15:30:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=tcOilUkk3h56Cl0Owy8JUt28eXElBcnJtGZsaIuU71k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NcCzoa0e/aKYAjazAOH6oCCbi6DhMsuoR+hvswX57BC7yACh8UwdeY5LJTliAUYVTti4kthWM
 XHG44HvCdACiYeQq2jqkIrswTRD6X4ODaDX2bANdMZkLYihZsD34m2ZfuG20C1HhWfLlXlq6Cln
 Mgar2zTaTh2bxyKObZLfDa+9jjRbgVYVqkdo8tpaHs5rt7hpdzbeV165orOya5PPCEexqFEuzLr
 9sFRuCZi9RZjUsqb3+9q3eh1D4lKByUGGUiv9xHUYxlQaCORP5ffWBDH0U7DA4muibNfqAz/qS/
 LgvUCf9ZqwrhtIcpX3AeZX+seGaQvG2XHHCH0hCG6MSg==
X-Zone-Loop: 3c6bf48189ac22221a4633fe81bdf595ec030847d54c
x-campaign-type: default
x-transaction-id: 10c22514-3d2f-4f29-8cf5-848f59f9f5d6
x-swg-uid: 01-c52230f2-8009-4c23-9868-033a609f295e
X-Mailer: Sweego
Message-ID:
 <1779456621.8631fc262581453bbf619ec5b2062170.19e4fe13aa6000f373@vates.tech>
x-swg-bid: 1779456621.8631fc262581453bbf619ec5b2062170.19e4fe13aa6000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:30:20 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 02/13] Switch Linux builds to use Alpine 3.23 container
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <23fbf2c275cfb021161688eb5f0e9013bfb4aa83.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23fbf2c275cfb021161688eb5f0e9013bfb4aa83.1777898148.git-series.marmarek@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1252.feae6614dcee22e0.19e4fe138b1.50f35089f595e84=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779456620721
X-purgate-ID: tlsNG-c1860d/1779456624-BD56FDB1-3ABD4168/0/0
X-purgate-type: clean
X-purgate-size: 770
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 965485B52C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.1252.feae6614dcee22e0.19e4fe138b1.50f35089f595e84=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 02:35:41PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Slowly phase out 3=2E18 one=2E
>=20
> But keep Linux 6=2E6 on Alpine 3=2E18 containers - it fails to build on
> Alpine 3=2E23 (due to GCC 15 defaulting to -std=3Dc23)=2E
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
---=Part.1252.feae6614dcee22e0.19e4fe138b1.50f35089f595e84=---

