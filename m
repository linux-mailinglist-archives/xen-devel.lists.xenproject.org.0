Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3GkLgBbTmrMLAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 16:13:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37ED7272BA
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 16:13:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Up99mdHl;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357090.1611591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whT1J-0001Cd-6D; Wed, 08 Jul 2026 14:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357090.1611591; Wed, 08 Jul 2026 14:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whT1J-0001A9-37; Wed, 08 Jul 2026 14:13:01 +0000
Received: by outflank-mailman (input) for mailman id 1357090;
 Wed, 08 Jul 2026 14:12:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f421317ed0002807@swg.vates.tech>)
 id 1whT1H-0001A3-7t
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:12:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whT1G-00AFNx-Kg
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:12:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f421317ed0002807@swg.vates.tech>)
 id 6a4e5ade-2eae-0a2a0a5409dd-0a2a45038f26-32
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:12:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f421317ed0002807@swg.vates.tech>)
 id 6a4e5aea-ec1a-0a2a45030019-b9ff1c229797-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:12:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f421317ed0002807.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 14:12:55 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A57D781F06;
 Wed,  8 Jul 2026 16:12:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=qg8mV7cTB8le9ORAeOS+/Jc7qO5eWdAV9jThja3gleE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Up99mdHlIQZ4DN2ou1vZrlxQMsj1uPlHXapoT9i7xPW4C7BTmUWVr5uIe2iOROGZTxpllkNK0
 cjUX8EXtP7uSSsXtTPnNYyAs1ZqFXWRkH7+hS5N1x0h6nWDJsU5P/MjyWrewHCtjUrepzRSrnXx
 LkZT3Kak7Onl0G9T3AY2mE9Dur385Zn1kZwjLMzgkGY0qGGl6ua7oOnl0khOwSriHnq4hynKeTN
 9wwuMNpOg+wNqHpnzy6ylau4C/YkdHdO+ArSLQ32CEwKozQHIOPR9aeNsqwMks1ENTy+/iSj5p4
 gFXe+gj1qskf66eZu/ZyzUKj5Rwj79tNM7KHFpXWdHRQ==
X-Zone-Loop: 72fb0882828738e86a500fc8f4723dbcd78b3c3b776e
x-campaign-type: default
x-transaction-id: 46913a67-6fd8-414c-9531-c8d3f3eb5069
x-swg-uid: 01-db013b5d-e984-4b78-a853-2d0cbdbdb3d4
X-Mailer: Sweego
Message-ID:
 <1783519975.8631fc262581453bbf619ec5b2062170.19f421317ed0002807@vates.tech>
x-swg-bid: 1783519975.8631fc262581453bbf619ec5b2062170.19f421317ed0002807
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 16:12:54 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 15/16] libs/guest: finalize PoC
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-16-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260619130501.272832-16-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.433.4af9d2b29e5c5fbc.19f421315b1.b68333ffdbba42ad=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783519974834
X-purgate-ID: tlsNG-33051d/1783519978-B59BA5D1-9F7DE215/0/0
X-purgate-type: clean
X-purgate-size: 787
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: D37ED7272BA

---=Part.433.4af9d2b29e5c5fbc.19f421315b1.b68333ffdbba42ad=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A note about the subject: When taken out of the context of this patch
series (so once commited), we don't know what "PoC" is refering to=2E In
"libs/guest: finalize PoC", it looks like "libxenguest" was the PoC, but
it isn't=2E

It feels like this patch wants to be merged into that other PoC patch,
and have a patch description completely rewritten to have something that
doesn't looks like the description of an experiment=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.433.4af9d2b29e5c5fbc.19f421315b1.b68333ffdbba42ad=---

