Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHyWFjHoBmpKowIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:32:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145654C777
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309785.1580834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNou5-0007hI-3z; Fri, 15 May 2026 09:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309785.1580834; Fri, 15 May 2026 09:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNou5-0007fr-0H; Fri, 15 May 2026 09:32:21 +0000
Received: by outflank-mailman (input) for mailman id 1309785;
 Fri, 15 May 2026 09:32:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2afab906000f373@swg.vates.tech>)
 id 1wNou3-0007fj-GM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:32:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNou2-001pLU-Hr
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:32:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2afab906000f373@swg.vates.tech>)
 id 6a06e81d-e002-0a2a0a5209dd-0a2a450187c4-12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:32:18 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2afab906000f373@swg.vates.tech>)
 id 6a06e822-c1f2-0a2a45010019-b9ff1c2298a3-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:32:18 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e2afab906000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 May 2026 09:32:14 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3389186361;
 Fri, 15 May 2026 11:32:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=frZrEIceEJBjky/XIZOPtKSrxZxciHjGS0LID6HlQdI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VxDBrXBE/YFscrQhvM1RC2sEuCgFB+7pbakQ0JXkE0fc9UJYimskk3d/P+6/HSa5mPnU7jdBR
 YV9j5ngiXOmuy7I7n7TbvkeYo39IWK6LKK6hrXd05g1zZHcyCPWp0CSt/ExMbVhz75M52ILJ9bv
 +Yed+/sZthN3JTjGmU+aiwYUrF1rOdi02eTxmCAKyTkX+JWCD0+i275jxJbUl3PTlpMOI2V+yLC
 EW8PALIgZyD9ijE4qxqKZ+U9Jbby/gARwYfBDXd5xEEJJOJjmb85ZSc4ZPyYBPknutWtSph/k+b
 5iKpK9UfZLbySNrTyc5A7Kr9hxKNIiG5ip2c8iKCXp4w==
X-Zone-Loop: b4e54ffadb1b12ed6d6c7c095950a8c9ef573f4e9a41
x-campaign-type: default
x-transaction-id: 80a8a379-4575-4c4f-a6d8-44aa66e23e82
x-swg-uid: 01-057b524d-0fff-4f4b-b284-09b78e30bf2e
X-Mailer: Sweego
Message-ID:
 <1778837535.8631fc262581453bbf619ec5b2062170.19e2afab906000f373@vates.tech>
x-swg-bid: 1778837535.8631fc262581453bbf619ec5b2062170.19e2afab906000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 15 May 2026 11:32:13 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 5/5] tools/xen-hvmctx: shorten various format strings a
 little
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <4bcd76e9-1bd5-4a2c-8d75-7d29b9dfa31f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bcd76e9-1bd5-4a2c-8d75-7d29b9dfa31f@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.c5a.f45f64b97bdcb137.19e2afab675.6e4fa590aafa495=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778837534325
X-purgate-ID: tlsNG-d62444/1778837538-B5947FF4-D4146F17/0/0
X-purgate-type: clean
X-purgate-size: 887
X-Rspamd-Queue-Id: 0145654C777
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

---=Part.c5a.f45f64b97bdcb137.19e2afab675.6e4fa590aafa495=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 05:00:43PM +0200, Jan Beulich wrote:
> %4=2E4x and alike format specifiers can be expressed shorter as %04x or,=
 as
> e=2Eg=2E dump_ioapic() has it, %=2E4x=2E
>=20
> In dump_fpu()'s XMM register dumping, also move away from showing bogus
> xmm03 and alike=2E The proper register name is xmm3 for that particular
> example=2E
>=20
> Also strip trailing whitespace from lines touched=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.c5a.f45f64b97bdcb137.19e2afab675.6e4fa590aafa495=---

