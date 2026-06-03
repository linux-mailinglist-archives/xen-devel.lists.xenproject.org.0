Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fOMhMD1FIGrDzgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:16:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E95663907E
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Ew+arfam;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1326862.1592156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnK5-0001nz-CT; Wed, 03 Jun 2026 15:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326862.1592156; Wed, 03 Jun 2026 15:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnK5-0001lF-86; Wed, 03 Jun 2026 15:16:01 +0000
Received: by outflank-mailman (input) for mailman id 1326862;
 Wed, 03 Jun 2026 15:15:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e8e0e398b000701b@swg.vates.tech>)
 id 1wUnK3-0001kx-Gg
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:15:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnK2-007jWN-QC
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:15:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e8e0e398b000701b@swg.vates.tech>)
 id 6a204525-2eae-0a2a0a5409dd-0a2a450ae33c-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:15:58 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e8e0e398b000701b@swg.vates.tech>)
 id 6a20452e-56b3-0a2a450a0019-b9ff1c1294dd-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:15:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e8e0e398b000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 15:15:57 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B8D8286DD5;
 Wed,  3 Jun 2026 17:15:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=j4KNTRu5Y3mgkM5VaS+1XPXGAw/9UaccVHJWw7S8y5M=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Ew+arfamLrjIXNIZQRhiKyxkNRurAbotrIS4ZG0QFbu8jYh7Um+GLiZ3fgS1jlS/sUBcgVaYW
 BlOyoRM/XgCjbUIr5lslhfKycu4GFSXkTBt1wsG7bUn34YOVjddpHso3bhxb9W1BN7+0ONAaUCt
 mdCNctqqyhP2fWegcBRv4lnoqpLRKCNgNP78/aBsuMJgZo939Kmj1vAAP67+shhQxgTcXlmORA8
 ZgZqe9RCyPo17/c4K2SBoo46SDab6kqfWaqNaMBxLYXR/jLWHY31UvSHsB3ClHhxN3Mx4Mt3Lkf
 WqgaJlZ0RTnfdcdsIc8PxFSriY3/89W0BA+O8/sFPoqw==
X-Zone-Loop: ac732d6e1bbe6720caf5827f165ad6b47fdca3996164
x-campaign-type: default
x-transaction-id: ca74d823-a30e-43ad-a506-272abe92b23d
x-swg-uid: 01-cfc6ffab-e29d-4b18-9d04-2bce3dee48d3
X-Mailer: Sweego
Message-ID:
 <1780499757.8631fc262581453bbf619ec5b2062170.19e8e0e398b000701b@vates.tech>
x-swg-bid: 1780499757.8631fc262581453bbf619ec5b2062170.19e8e0e398b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 3 Jun 2026 17:15:56 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.22 2/5] tools/macros: adjust ROUNDUP() interface to
 match hypervisor
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260601154332.30797-3-roger.pau@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1cf4.e81e5d4cb6a0dfdf.19e8e0e3763.df6aaf93657816b6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780499756900
X-purgate-ID: tlsNG-4011c0/1780499758-7D5868B7-35FE2464/0/0
X-purgate-type: clean
X-purgate-size: 651
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,vates.tech:server fail,citrix.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:julien@xen.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:from_mime,vates.tech:url];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,citrix.com,recoil.org,xen.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E95663907E

---=Part.1cf4.e81e5d4cb6a0dfdf.19e8e0e3763.df6aaf93657816b6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 05:43:29PM +0200, Roger Pau Monne wrote:
> Adjust user-space callers to use the new interface=2E  No functional cha=
nge
> intended=2E
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1cf4.e81e5d4cb6a0dfdf.19e8e0e3763.df6aaf93657816b6=---

