Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +HXBJNK0R2pDdwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:10:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E7702B31
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:10:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="gOV/hZ3g";
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353355.1609310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfdf4-0004TT-TE; Fri, 03 Jul 2026 13:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353355.1609310; Fri, 03 Jul 2026 13:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfdf4-0004RI-Qb; Fri, 03 Jul 2026 13:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1353355;
 Fri, 03 Jul 2026 13:10:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f281a15d000080a8@swg.vates.tech>)
 id 1wfdf3-0004RB-RF
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:10:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfdf3-00HJ8H-82
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 15:10:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f281a15d000080a8@swg.vates.tech>)
 id 6a47b4bf-2eae-0a2a0a5409dd-0a2a4509ab62-24
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:10:29 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f281a15d000080a8@swg.vates.tech>)
 id 6a47b4c4-97e6-0a2a45090019-b9ff1c12a495-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:10:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f281a15d000080a8.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jul 2026 13:10:26 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 43EA881BF1;
 Fri,  3 Jul 2026 15:10:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=xUYMzz16TJmepg947+pGYhGIre2CDd2/iM8L4cia8cI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gOV/hZ3g8NGAqUHMg8WDRoqzaZow4G0De3jJBLiXTau6I5aKHhI5rqres9ZA1xQRlLIAMxKrp
 DYPn0QyQkek0gxFWBoRTHMkD+WpFFsbQA65jYGB7+YJ/P45eo/MYWoe2FS/4ItT269o06bKkN8o
 yPaa91OyF+ndbh5nJuCkSsSqiQj/23RelTTnOWHCLxwUKfk1mTDBisgCH2X7/ZYJcxK1zYvbR0Y
 G+93c7CFND+xZ3CSLdoL+dr/cjlL+iwMghV3+juVRDh5fVgef9gd0YCQ2qAARAfdnOzykg+c+y9
 tifI1RCx2ejegldn0MTlXoYdzEWk7PFPq9QCvYn8V5zg==
X-Zone-Loop: b38b0842b25709e937141a36b9064441bca85a7ef37a
x-campaign-type: default
x-transaction-id: 3a1740db-54fc-4c2a-b1b8-a70c7911fd62
x-swg-uid: 01-72aad2ae-2065-492a-80e5-210a2f103eb2
X-Mailer: Sweego
Message-ID:
 <1783084226.8631fc262581453bbf619ec5b2062170.19f281a15d000080a8@vates.tech>
x-swg-bid: 1783084226.8631fc262581453bbf619ec5b2062170.19f281a15d000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 3 Jul 2026 15:10:25 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] argo: fall back maintainership into the rest
References: <20260702163845.36453-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702163845.36453-1-roger.pau@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.c9.8bbea27004231cbf.19f281a1381.e615ae573bc4ba06=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783084225410
X-purgate-ID: tlsNG-bad1c0/1783084229-56B97986-314FB8B7/0/0
X-purgate-type: clean
X-purgate-size: 940
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email,citrix.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 0F7E7702B31

---=Part.c9.8bbea27004231cbf.19f281a1381.e615ae573bc4ba06=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 06:38:45PM +0200, Roger Pau Monne wrote:
> Due to unresponsiveness of the current maintainer=2E  In particular, the
> committers have been trying to get in touch with Christopher for 2 weeks=
 to
> have a chat about disputes around recent commits and pending changes to =
the
> ARGO component without getting any response=2E
>=20
> Signed-of-by: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>
> ---
> This patch is on behalf of the committers, and not a personal decision o=
f
> its author=2E

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.c9.8bbea27004231cbf.19f281a1381.e615ae573bc4ba06=---

