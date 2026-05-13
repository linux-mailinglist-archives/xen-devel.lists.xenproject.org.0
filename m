Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF6cK0g8BGqsGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:54:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FD53000D
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307697.1579281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5MC-0000FV-1f; Wed, 13 May 2026 08:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307697.1579281; Wed, 13 May 2026 08:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5MB-0000Cj-UJ; Wed, 13 May 2026 08:54:19 +0000
Received: by outflank-mailman (input) for mailman id 1307697;
 Wed, 13 May 2026 08:54:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e208b39e3000f373@swg.vates.tech>)
 id 1wN5MA-0000Cd-PI
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:54:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN5M9-00CY5T-Pj
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:54:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e208b39e3000f373@swg.vates.tech>)
 id 6a043c2a-e002-0a2a0a5209dd-0a2a450a996e-20
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:54:17 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e208b39e3000f373@swg.vates.tech>)
 id 6a043c39-56b3-0a2a450a0019-b9ff1c22aaab-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:54:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e208b39e3000f373.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 May 2026 08:54:15 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 28A208636C;
 Wed, 13 May 2026 10:54:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CnX5O2p0QQt5FLQjcwiWGsVpu665UGO3dj9rFSugdp0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LWkcILAftIv27KTNFL47Ipr6M7dOwFWkBMbhjAzcuadX9oNCDQ/T6ySYSUV/M5YNigUxFOm1d
 kCLzTfIocW3CdKpFc1kX9QUsEB+E4bT1SoCeQj2wGI6B9GD92BKU/08faEKoZyfXwhxK0NaXwzf
 liJ+GbJevitfm9MvU6mXQA0dFLSsX7meQWVXBaXtgHUA7Cx8KSODFD7dmS1uimMkBSDcLHIu6Lw
 TTBpv7LaBRN7u9TPdQv0T5RLbqofN/ig+BKfo8vnlgghj+SIzgGKL7dRD3c3oEX17YK2n2HnraC
 b5+8PpScMyYLLJ8YyYOtHUMZWsY5qzQ10RvB22Yxbwig==
X-Zone-Loop: 0d44efe66d2677e8fdc59c183b4a15c138599af1783b
x-campaign-type: default
x-transaction-id: 1bd0ce06-9756-48cc-9595-2b1214142419
x-swg-uid: 01-5aff09eb-c63c-4706-8dde-af8328650e2b
X-Mailer: Sweego
Message-ID:
 <1778662455.8631fc262581453bbf619ec5b2062170.19e208b39e3000f373@vates.tech>
x-swg-bid: 1778662455.8631fc262581453bbf619ec5b2062170.19e208b39e3000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 13 May 2026 10:54:14 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xl/parse: mark as GNU source
References: <8d758429-8c2b-4578-a2fc-9ac7dac0a62f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d758429-8c2b-4578-a2fc-9ac7dac0a62f@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b15.30d14826cf67bb18.19e208b37be.fde1075920b6cad1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778662455230
X-purgate-ID: tlsNG-4011c0/1778662457-7DB818B7-A7E1A28C/0/0
X-purgate-type: clean
X-purgate-size: 927
X-Rspamd-Queue-Id: 616FD53000D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWO(0.00)[2];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

---=Part.b15.30d14826cf67bb18.19e208b37be.fde1075920b6cad1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 09:37:02AM +0200, Jan Beulich wrote:
> Very old glibc (2=2E4 in the observed case) declares strndup() only when
> _GNU_SOURCE is defined=2E
>=20
> Fixes: ad860c6454ba ("tools/xl: add xl commands for xenstore quota opera=
tions")
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

> ---
> This follows what xl_info=2Ec and xl_utils=2Ec already do=2E Question is=
 whether
> instead the Makefile would want to uniformly define _GNU_SOURCE=2E

It would probably be ok to do so=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.b15.30d14826cf67bb18.19e208b37be.fde1075920b6cad1=---

