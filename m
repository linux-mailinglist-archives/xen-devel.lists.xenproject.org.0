Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z8HsNUAtLGqxMwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 18:01:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C941467AAE8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 18:01:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=PQfaBpfV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336868.1598629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY4J6-0007fd-W6; Fri, 12 Jun 2026 16:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336868.1598629; Fri, 12 Jun 2026 16:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY4J6-0007cu-TJ; Fri, 12 Jun 2026 16:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1336868;
 Fri, 12 Jun 2026 16:00:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc903979000701b@swg.vates.tech>)
 id 1wY4J4-0007Xt-Po
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:00:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY4J3-008y3d-Vf
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 18:00:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc903979000701b@swg.vates.tech>)
 id 6a2c2d16-bab6-0a2a0a5309dd-0a2a4505e6ea-24
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 18:00:29 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc903979000701b@swg.vates.tech>)
 id 6a2c2d1d-aaa8-0a2a45050019-b9ff1c12a613-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 18:00:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebc903979000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 16:00:29 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5F3EF865B3;
 Fri, 12 Jun 2026 18:00:28 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3MDYORQ2/HObof12QTlwkRL6Zu9+9HTrgmSn8/TCx1k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=PQfaBpfVece4r+LkcrWdzWxxn5VpbXqknHsV2micAE5H6duknr24LKXdgOJbgDxHQ1yf1aCMX
 yQDJSebzE6Rg/jg6dSYziYxCnMWQUmIit+uvuJCHpkbRzJUS2GYfasPIfx3VLpDoI2gJfVZPjPH
 rN0ASgMPK2icHS5Vr2XR0HR+ARhZ65Lk0NMRZvGeqDkLQNQ0sF00n8TcJBaX1gdjMitJdyg/J//
 NuYGR/HG58jpZyftudnjNM3H8c+fMimOTGj3qlnpSWXqHqiIEDhcIZEi7+ONEeDaNQNXNtH1qqr
 ublhHxbGUfadXRRESs6PS7d6tsw8kADeAqBdN+tjZO0g==
X-Zone-Loop: 29556d0dec5914c2345b15765337294f43315ee53143
x-campaign-type: default
x-transaction-id: 8ba2bf3a-e7eb-4faf-ba07-62c3d6663f5e
x-swg-uid: 01-51e3ce32-87a9-4dcb-b3a7-9c81f4801e1a
X-Mailer: Sweego
Message-ID:
 <1781280029.8631fc262581453bbf619ec5b2062170.19ebc903979000701b@vates.tech>
x-swg-bid: 1781280029.8631fc262581453bbf619ec5b2062170.19ebc903979000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 18:00:28 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI,
 runtime path
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com>
 <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.14c.11b94f4865e79323.19ebc903737.aeb62011a2203c77=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781280028471
X-purgate-ID: tlsNG-c201ff/1781280029-DB16D443-0FC8BD84/0/0
X-purgate-type: clean
X-purgate-size: 1259
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:bernhardkaindl7@gmail.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C941467AAE8

---=Part.14c.11b94f4865e79323.19ebc903737.aeb62011a2203c77=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 05:41:07PM +0200, Bernhard Kaindl wrote:
> Hi Anthony, could you test this patch which exactly applies the changes =
Jan
> suggested? Summary:

Sure but could you use `git send-email` to send patch please? Trying to
apply this email is not fun=2E The patch part is just corrupted=2E I might
try to edit the source by hand=2E=2E=2E

If you have a good setup, sending a patch is really just `git send-email
-1`, if you want to send it as a reply to an email, there's
`--in-reply-to` for that, but that's not really necessary, and sometime
counter productive=2E And no need to for `--cc` to CC me, has `git` can
also pick that up from the "reported-by"=2E ;-)

If you want to add comments to a patch, and not have it committed, do not
use "PS:" after a signature=2E Add it between the "---" line and the first
line starting by "diff ", like git do with the diffstat=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.14c.11b94f4865e79323.19ebc903737.aeb62011a2203c77=---

