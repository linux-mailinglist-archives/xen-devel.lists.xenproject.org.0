Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Am+wASM5OWpkowcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:31:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F96AFE09
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:31:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=SYcKZZ9i;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1343743.1602973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbejv-0001AF-PJ; Mon, 22 Jun 2026 13:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343743.1602973; Mon, 22 Jun 2026 13:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbejv-00018m-M6; Mon, 22 Jun 2026 13:31:03 +0000
Received: by outflank-mailman (input) for mailman id 1343743;
 Mon, 22 Jun 2026 13:31:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@swg.vates.tech>)
 id 1wbeju-000184-45
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:31:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbejs-006KOz-RX
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:31:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@swg.vates.tech>)
 id 6a393909-bab6-0a2a0a5309dd-0a2a4508ae4c-40
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:31:00 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@swg.vates.tech>)
 id 6a393914-9ee7-0a2a45080019-b9ff1c128679-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:31:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eef86ef2b000701b.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jun 2026 13:30:58 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 658F486AF4;
 Mon, 22 Jun 2026 15:30:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=GwQ6hm4F0MeoiE3YABrvwHcyKOrf1yvwiCG4hVP2X/8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=SYcKZZ9iAxkPWKrJwTMkDFldEmCZHvCy6JuiIUHutswNwPrHdF7bhDfcsn5gOmlb7sUbpPKmW
 0CIHTDKkONBEmrePgXQ5u23VGKLOoflj/Kz5oAOEhPoDuDxePzNrBiKk7Ogl5b8/6QMhX2W5D6W
 dW0HR/OocBg/K60pwFjsNlgJHXAzjvwzxUm0oIy2fdBJ+PZODIchQ2IQyr+jqnM+AW7rTQs9C+V
 q1dy7S9K4cE7PwgVh5XHZHkbQzp9w5PZFhciw1qDCBpVZOAkeQ9Uqs8O3yzNdlt1NDebeu9tGsF
 1dZgKxVgkNj9cnHVKWisu7R02/hUrt4v32j0EJSLwByg==
X-Zone-Loop: 59fd5cde602c309d8c9b86fb44b54c8d7e8919a8e922
x-campaign-type: default
x-transaction-id: 02bc8435-eaeb-496a-959c-38877451c82f
x-swg-uid: 01-4ed7bf1c-4b53-44f7-8554-cb86aa18fedb
X-Mailer: Sweego
Message-ID:
 <1782135058.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b@vates.tech>
x-swg-bid: 1782135058.8631fc262581453bbf619ec5b2062170.19eef86ef2b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 22 Jun 2026 15:30:57 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 4/6] libxl: Extend libxl__json_object_to_json()
 prototype
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
 <1776955855.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1776955855.8631fc262581453bbf619ec5b2062170.19dbad29220000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.939.1e6a0ec3bcff382a.19eef86ec5c.7efd0d5a77d1c01d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782135057500
X-purgate-ID: tlsNG-c1860d/1782135060-5CFFD0FA-8241D763/0/0
X-purgate-type: clean
X-purgate-size: 1212
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 798F96AFE09

---=Part.939.1e6a0ec3bcff382a.19eef86ec5c.7efd0d5a77d1c01d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 04:50:29PM +0200, Thierry Escande wrote:
> The function libxl__json_object_to_json() returns a json object as
> string in a pretty format=2E

> With support for the new PCI device
> passthrough option hotplug=3D0,=20

That biggining of the sentence, which mention of hotplug=3D0 can be
removed=2E


> the function will be used to generate the
> json string passed to qemu -device command line parameter, but the
> string needs to be in plain format, i=2Ee=2E without carriage return or =
tab
> characters=2E
>=20
> This patch adds a 'pretty' parameter to the function to control the
> output string format=2E
>=20
> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>

With the commit message striped of the mention of the "hotplug"
option: Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.939.1e6a0ec3bcff382a.19eef86ec5c.7efd0d5a77d1c01d=---

