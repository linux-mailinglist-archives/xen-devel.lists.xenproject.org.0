Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id igrKJP6HQ2qUaQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 11:10:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C56E1F42
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 11:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=MS5oNJI0;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1348567.1606297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUTV-0000jZ-3f; Tue, 30 Jun 2026 09:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348567.1606297; Tue, 30 Jun 2026 09:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUTV-0000hw-0b; Tue, 30 Jun 2026 09:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1348567;
 Tue, 30 Jun 2026 09:09:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@swg.vates.tech>)
 id 1weUTT-0000hq-Vg
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:09:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUTT-0055Hg-6w
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:09:47 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@swg.vates.tech>)
 id 6a4387d6-bab6-0a2a0a5309dd-0a2a45098c4e-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:09:47 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@swg.vates.tech>)
 id 6a4387da-97e6-0a2a45090019-b9ff1c128981-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:09:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f17ca9170000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 30 Jun 2026 09:09:39 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8221886AB6;
 Tue, 30 Jun 2026 11:09:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2QoCeG1LvFRIzn8MHvc0E/BI6Q5ItNlox/vRAxZXeMQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=MS5oNJI0RHuXhGran0MEG0Yc6n4jnKp7eJFRB75yuZnLIREVlI3knTGQiMTnYqKxpz5EScE1H
 DO8zmLXI40LmRDKaqRd0KRuprcfno25hPG8AN1IFDDNVX/ged7mhA9wJj4m6CPYHBgF+FP7qCDa
 JSCUeL/tbWw8MipVCM4wgq6PWId93u5aPLTzedEMPiteuBeekiIkN3T9gy06dw2iy7XoIAGnRgs
 zCPlWxi3DSJKV6sDdD9QAc2SzUQXVcU6Qf6erUwaiQRlneIF59SrStvja6M8oaEF/gR9lnqwJFS
 AWsgUVRV1GQyNLipgx8NYjDQl9+6L+3karOqRExs9/hg==
X-Zone-Loop: fdc810e50b6861565024c0abcc5c15f32c8e8996d8f5
x-campaign-type: default
x-transaction-id: fe0c18d1-126c-4230-aba2-5109a764815b
x-swg-uid: 01-d2c62ef2-420c-403f-94e3-9dda8a3434b5
X-Mailer: Sweego
Message-ID:
 <1782810579.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@vates.tech>
x-swg-bid: 1782810579.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 30 Jun 2026 11:09:38 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/18] PCI SBDF Refactoring
References: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
 <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
 <1782809635.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@vates.tech>
 <fe2a6a17-9742-4387-9664-271934f93ab4@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe2a6a17-9742-4387-9664-271934f93ab4@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.89a.1910bfce05f213f.19f17ca8f08.b4124361e83b0921=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782810578696
X-purgate-ID: tlsNG-bad1c0/1782810586-4713E986-74A42F6A/0/0
X-purgate-type: clean
X-purgate-size: 780
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 340C56E1F42

---=Part.89a.1910bfce05f213f.19f17ca8f08.b4124361e83b0921=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 09:57:35AM +0100, Andrew Cooper wrote:
> How are you sending the series?=C2=A0 Your old double-delivery problem (=
now
> fixed) I can see being the intermediate infrastructure, but I don't see
> how that would apply to this kind of issue=2E

It's the SMTP server that `@vates=2Etech` uses that mangle with
message-id, so `git send-email` can't make proper email thread and the
cover-letter appear isolated=2E


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.89a.1910bfce05f213f.19f17ca8f08.b4124361e83b0921=---

