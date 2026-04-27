Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKbOErZK72lO/wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 13:38:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB683471DBD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 13:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294848.1571550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHKHl-0006so-JL; Mon, 27 Apr 2026 11:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294848.1571550; Mon, 27 Apr 2026 11:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHKHl-0006q9-Gn; Mon, 27 Apr 2026 11:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1294848;
 Mon, 27 Apr 2026 11:37:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcebb4015000f373@swg.vates.tech>)
 id 1wHKHj-0006m6-C7
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 11:37:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHKHh-00CCkb-6R
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:37:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcebb4015000f373@swg.vates.tech>)
 id 69ef4a7c-5cb7-0a2a0a5109dd-0a2a4503bc50-42
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 13:37:52 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcebb4015000f373@swg.vates.tech>)
 id 69ef4a90-672d-0a2a45030019-b9ff1c22b0b1-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 13:37:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcebb4015000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 11:37:51 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9555780F59;
 Mon, 27 Apr 2026 13:37:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=hrWP7PDOax19ipthmTHj5VA87kpS9207hOAXZ+9QQII=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=qZZCIgtUIxp43hXoj9Ud6chhyFjqMORWIUDH/I37nPLrXtYhuHMNfXuCx2BfrtNydeoqojodV
 60EtvVOLc2fHTcHcG8ApbS866IIRTpB23tedXu31LhblJchguwuLPRFh4wNA9aMSvFhKyW4OZEV
 gWDYrICba+EdCfqtzc+k3r74/VY5BbpKg8dVXjNSaVhdPzyIob8mItOPHTOjaLFwsNqncHv+J1G
 KwCr6Ag0vi59bMuNk+ZWZ+x28jsaMkR6BXkBQqGmGQ3TRdHOCnwxtLwQWeXyTIqseNYicfcsDeU
 ssACWTlWAbvIflezu3XfQD77g34M0fwuhwLlgnTPrHXw==
X-Zone-Loop: 492a10de2d9539b7d5598e7f4b37dac5a76e200bbdf9
x-campaign-type: default
x-transaction-id: b805f4ec-9786-4370-b7af-896787cb240a
x-swg-uid: 01-893d04e9-0ece-4f91-8421-830e938dd535
X-Mailer: Sweego
Message-ID:
 <1777289871.8631fc262581453bbf619ec5b2062170.19dcebb4015000f373@vates.tech>
x-swg-bid: 1777289871.8631fc262581453bbf619ec5b2062170.19dcebb4015000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 27 Apr 2026 13:37:50 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 0/7] Minor xenguest optimisations
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2943.c447f66c6a72a997.19dcebb3dbc.51a878fbab5a8cc9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777289870780
X-purgate-ID: tlsNG-33051d/1777289872-A2F62938-9DE6C680/0/0
X-purgate-type: clean
X-purgate-size: 1452
X-Rspamd-Queue-Id: DB683471DBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:dkim,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2943.c447f66c6a72a997.19dcebb3dbc.51a878fbab5a8cc9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 11:53:25AM +0100, Frediano Ziglio wrote:
> Edwin T=C3=B6r=C3=B6k (2):
>   tools/libs/guest: allocate various migration arrays just once
>   tools/lib/call: cache up to 4 pages in hypercall bounce buffers
>=20
> Frediano Ziglio (5):
>   xenguest: Reduce number of parts in write_split_record
>   xenguest: Reduce number of I/O vectors in write_batch
>   xenguest: Allows writev_exact to change iov array
>   xenguest: Reduce number of I/O vectors in write_batch
>   xenguest: Use a single write_exact in write_headers

Hi Frediano,

When you will resend the patch, could you change the prefix? "xenguest"
to me is a XenServer / XCP-ng binary that happen to live in the xen
repo, not something that exist upstream=2E There's plenty of better way to
prefix those commits, looking at the history of the lib:
    libs/guest
    libs/xg
    tools/libs/guest
    tools/xg
    tools/libxg
    tools/libs/guest

I think I prefer "libs/guest"=2E

And looks like there's one patch that doesn't touch libxenguest at all,
yet it is prefix with "xenguest:"=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2943.c447f66c6a72a997.19dcebb3dbc.51a878fbab5a8cc9=---

