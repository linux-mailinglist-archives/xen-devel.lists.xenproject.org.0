Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NFKsFJ0ZTmrqDAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:34:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E538C723C63
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 11:34:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=ELnlRnmW;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356749.1611294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOfU-0006eb-1U; Wed, 08 Jul 2026 09:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356749.1611294; Wed, 08 Jul 2026 09:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOfT-0006cy-UP; Wed, 08 Jul 2026 09:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1356749;
 Wed, 08 Jul 2026 09:34:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4113cea800080a8@swg.vates.tech>)
 id 1whOfS-0006cp-Lj
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOfR-009Jue-EF
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:34:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4113cea800080a8@swg.vates.tech>)
 id 6a4e1986-5cb7-0a2a0a5109dd-0a2a4506cf32-38
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:34:09 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f4113cea800080a8@swg.vates.tech>)
 id 6a4e1991-08de-0a2a45060019-b9ff1c12b287-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:34:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f4113cea800080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:34:04 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4BE6D81D83;
 Wed,  8 Jul 2026 11:34:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=XpamGaYQvw+3YjHzOong6XuoyvFL4oqb+k2lh850Ae4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ELnlRnmWbbeIQhOcNyidhZ69By7d1mJ+YTcaECD3NqHH8bNnHWv9l99QV85cRxl0CYydjqp/Y
 tY61Z7G6g3NElkxnkvhQvnZzKF47a6i4q2v2ORvTkl9vBccrBctcZOXsDUTPg2geASBiFCUWkiz
 iJLSUqiXir7CCBfzaduvt2hGobDw9dgKVBllzst4IKLO3CEPE6AdDKC+G5kx5UxohCzbBLzMJ5i
 1DM/D3DYCap1S8/xiQzlOS8K9V92r6kLQA2HDfUJyzxhz92EeGZfTXlLiiHItUhiP/bnomKlX78
 fIfJ7DWCP0/YpfUKWibgPFwEFk6AkLR8hfaApGhewB1A==
X-Zone-Loop: 2fabb0fc48a13568c3d24e1e1407084eb8dec78d16cd
x-campaign-type: default
x-transaction-id: 0250ad51-7cc1-4973-9604-84e5ff38cf54
x-swg-uid: 01-aaac5e14-13de-4875-8856-5713489adfac
X-Mailer: Sweego
Message-ID:
 <1783503245.8631fc262581453bbf619ec5b2062170.19f4113cea800080a8@vates.tech>
x-swg-bid: 1783503245.8631fc262581453bbf619ec5b2062170.19f4113cea800080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:34:04 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 03/16] libs/guest: Reduce number of I/O vectors in
 write_batch
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-4-frediano.ziglio@citrix.com>
 <73d8b955-8462-47ce-8913-d11303bf63c3@citrix.com>
 <CAHt6W4cYmoRxgAs=hX6zcvhPA3j9Jeb+9X+Z+OAayB0owYNvHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHt6W4cYmoRxgAs=hX6zcvhPA3j9Jeb+9X+Z+OAayB0owYNvHw@mail.gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3e4.7aa620b5ae91f645.19f4113ccb8.bb17dbe06c8c47c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783503244473
X-purgate-ID: tlsNG-16d1c6/1783503249-F9F9268D-10739C45/0/0
X-purgate-type: clean
X-purgate-size: 1464
X-Rspamd-Action: no action
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E538C723C63

---=Part.3e4.7aa620b5ae91f645.19f4113ccb8.bb17dbe06c8c47c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 01:33:05PM +0100, Frediano Ziglio wrote:
> On Tue, 30 Jun 2026 at 17:47, Andrew Cooper <andrew=2Ecooper3@citrix=2Ec=
om> wrote:
> >
> >
> > This has the same exact subject as the prior patch=2E
> >
> > Either it wants merging, as they're both in the same function, or the
> > subject wants to be different=2E  Even a "Further =2E=2E=2E" prefix wo=
uld help=2E
> >
> > On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> > > Each page was sent using a different iovec item=2E This potentially =
exceed
> > > Linux maximum (1024)=2E
> >
> > Linux cannot have a maximum of 1024 because this has been working fine
> > for a decade using 1028 in the common case=2E
> >
>=20
> But the code does not call writev or similars directly, so there's no
> limit besides the sky=2E
> The result with 1028 is simply that you do 2 system calls instead of one=
=2E

Could you add something along those lines to the description? And turn a
sentence saying there's a bug into a description saying it's suboptimal=2E

With that: Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3e4.7aa620b5ae91f645.19f4113ccb8.bb17dbe06c8c47c=---

