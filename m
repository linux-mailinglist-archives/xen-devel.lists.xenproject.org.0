Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iOuzNmXeQ2rjkgoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:19:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C356E5DAB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:19:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=VhYxEz+J;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1349128.1607008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaEY-0006fU-Ul; Tue, 30 Jun 2026 15:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349128.1607008; Tue, 30 Jun 2026 15:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaEY-0006cs-S7; Tue, 30 Jun 2026 15:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1349128;
 Tue, 30 Jun 2026 15:18:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@swg.vates.tech>)
 id 1weaEX-0006cm-D7
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:18:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaEW-006Njz-QF
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:18:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@swg.vates.tech>)
 id 6a43de47-5cb7-0a2a0a5109dd-0a2a4502acd2-48
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:18:44 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@swg.vates.tech>)
 id 6a43de54-5a27-0a2a45020019-b9ff1c129417-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:18:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f190a6e19000701b.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 30 Jun 2026 14:59:01 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id BFCB386A75;
 Tue, 30 Jun 2026 16:59:00 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YW5X7zRusNTwbnnKwJj/CtWjJoHj9/tPDJBCg7nrmYk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VhYxEz+JsuK6/gJtTYE2HAa4wXUrAnOjok/jljcHQOhmu3naxVTWZoIgwoDEjU6R+Se+eqpfX
 HfnLfgC3PRLRQuzhBTffNK9HfGnE/4ikcKkJId/4WxBkqXTPp5io9G8MJwYSbvfP7FOMtluD67n
 jJMHNAg58u1GyMf8preORVjs1NBzCSj4oMunEd3Qjh7/hcNc5wLJOHLPP5l4mg/fo8qDiKAZAPQ
 dfs8Y20pXtG7lDLCLv9oLxanXIa2nOPFD30h/MMBFTcIjKiGkh8XGfMD0QCaE3Ctynt3ohvEeqM
 cGvT8yAHvouWtB6LwPMYuTsN2cYhs/OCjpx7Bq/alxFQ==
X-Zone-Loop: 8fb4b8a9488150c4d678d496e75030c7c3122f7d0d75
x-campaign-type: default
x-transaction-id: 8d1b0e7d-a500-410e-942f-10f74df76edb
x-swg-uid: 01-1cd52609-1fba-482f-a0bb-035cc0b87663
X-Mailer: Sweego
Message-ID:
 <1782831541.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@vates.tech>
x-swg-bid: 1782831541.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 30 Jun 2026 16:59:00 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/4] libxc: adjust string size calculations in
 xc_{,de,test_}assign_dt_device()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <8adede4b-f25d-4a77-9fec-bd099119b005@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8adede4b-f25d-4a77-9fec-bd099119b005@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.93c.5d343de3e24a5943.19f190a6aa8.4de00f4c82dc6110=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782831540904
X-purgate-ID: tlsNG-720697/1782832724-77D187C5-DCA9C914/0/0
X-purgate-type: clean
X-purgate-size: 639
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79C356E5DAB

---=Part.93c.5d343de3e24a5943.19f190a6aa8.4de00f4c82dc6110=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:00:54AM +0200, Jan Beulich wrote:
> In preparation for a hypervisor change also include the nul terminator i=
n
> the size calculations=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.93c.5d343de3e24a5943.19f190a6aa8.4de00f4c82dc6110=---

