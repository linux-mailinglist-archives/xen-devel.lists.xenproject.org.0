Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o6amECrcVGr+fwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 14:38:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BB74B03D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 14:38:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=KPbGYLdA;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1361649.1613810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjFuG-0003Tv-Rr; Mon, 13 Jul 2026 12:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361649.1613810; Mon, 13 Jul 2026 12:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjFuG-0003SD-P0; Mon, 13 Jul 2026 12:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1361649;
 Mon, 13 Jul 2026 12:37:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5b7b1e60000edb5@swg.vates.tech>)
 id 1wjFuE-0003S7-Ff
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 12:37:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjFuD-008CUi-OM
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 14:37:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5b7b1e60000edb5@swg.vates.tech>)
 id 6a54dbeb-e002-0a2a0a5209dd-0a2a45039dd0-24
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:37:05 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5b7b1e60000edb5@swg.vates.tech>)
 id 6a54dbf0-f2d2-0a2a45030019-b9ff1c2384bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 14:37:05 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f5b7b1e60000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 13 Jul 2026 12:37:03 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5E85B81F9E;
 Mon, 13 Jul 2026 14:37:02 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+kj2FEPWo6JQgweJqlZj0n6FZdXfSGmHGQdXtO98Yvk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KPbGYLdA2t6WRFc050WbX9t6/Sa4G0PTuUQcLWd7EUWgPjNDUrjX3E1sLXy3LTt7SubvJJxIJ
 vWLLLBlZcXiKUJAN5UyB3R/Ig2X9RFlgNrIAw5g6/eRfd5gPYLoP1GKQ/GmPClKJKqr/5Br8iJe
 BGbXDMNTBt6m1XkaS/ZvGVMswSayiG7fNKac/UsYhLnZFbIaw5DlSDlwWd0mgUpUVXkO4FUcWOT
 C6ZOEGr2wuNCrC2qQb91HHbnj+LgLe7nY+PWU5+ySlB9aBS1FsJnj3JlyFzpF08n2JVEgvlm9uw
 Nzt057GZe+o/aMsKhe7chirq8Zns3mL5zDU6ozNc1wKA==
X-Zone-Loop: 8591252e27381804ed49626e646ecacfef2463a158e5
x-campaign-type: default
x-transaction-id: 5014c05e-2c25-4a1a-9518-46c0efb40ae6
x-swg-uid: 01-bb4b480e-7e0c-4071-bb26-11cfb4ce95df
X-Mailer: Sweego
Message-ID:
 <1783946223.8631fc262581453bbf619ec5b2062170.19f5b7b1e60000edb5@vates.tech>
x-swg-bid: 1783946223.8631fc262581453bbf619ec5b2062170.19f5b7b1e60000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 13 Jul 2026 14:37:02 +0200
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
Subject: Re: [PATCH v8 1/4] libs/call: cache up to 4 pages in hypercall
 bounce buffers
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
 <20260711212128.505727-2-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711212128.505727-2-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.700.91d9d5d2a9657446.19f5b7b1c11.cfaa172025315b39=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783946222610
X-purgate-ID: tlsNG-33051d/1783946225-CA351CF4-9D286708/0/0
X-purgate-type: clean
X-purgate-size: 1175
X-Rspamd-Action: no action
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
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,vates.tech:dkim,vates.tech:url,vates.tech:from_mime,vates.tech:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: AE7BB74B03D

---=Part.700.91d9d5d2a9657446.19f5b7b1c11.cfaa172025315b39=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 10:21:25PM +0100, Frediano Ziglio wrote:
> From: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
>=20
> During migration there are a lot of mmap/munmap calls,
> because xc_get_pfn_type_batch() exceeds the default hypercall bounce
> buffer cache size, and needs to allocate every time it is called=2E
>=20
> munmap() is slow, especially in a PV Dom0 (takes an emulation fault),
> so is best avoided=2E
>=20
> Eventually it'd be good if the memory pool from  xmalloc_tlsf=2Ec
> was reused here, but for now make it handle the commonly encountered
> sizes (so far up to 4 pages)=2E
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.700.91d9d5d2a9657446.19f5b7b1c11.cfaa172025315b39=---

